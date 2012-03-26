require 'ruble'
require 'ruble/ui'

command t(:tidy) do |cmd|
  cmd.key_binding = 'CONTROL+M2+H'
  cmd.scope = 'text.html'
  # Port using online tidy
#  cmd.output = :show_as_html
#  cmd.input = :selection, :document
#  cmd.invoke do |context|
#    require 'httpclient'
#    $KCODE = 'U'
#    page = $stdin.read
#    page.gsub!(/<\?(php|=).*?\?>|<%.*?%>/m, '')
#
#    # try direct input path
#    result = HTTPClient.post 'http://infohound.net/tidy/tidy.pl', { "_html" => page, "char-encoding" => 'utf8', 'indent' => 'yes', 'doctype' => 'strict',
#            'enclose-text' => 'true', 'output-xhtml' => 'true', 'wrap-php' => 'no', 'indent' => 'yes', 'wrap' => '0' }
#    
#    content = result.content
#    # FIXME This isn't working, also we need to grab the textare output and use that as our output
#    content
#  end
  
  # Port using local tidy
  cmd.output = :replace_document
  cmd.input = :document
  cmd.invoke do |context|
    windows = ENV['OS'] && ENV['OS'].downcase.include?("win")
    tab_size = (ENV["TM_TAB_SIZE"] || 2).to_i
    cmd_line = nil
    temp = windows ? "#{ENV['TMP']}/tm_tidy_errors" : '/tmp/tm_tidy_errors'
    # we removed the '--show-body-only yes' option, since it's outputing just the body part, as specified.
    # usually, the user would like to Tidy the selection or the entire file.
    if windows
      # FIXME Check if tidy is installed...
      cmd_line = "\"\"#{ENV['TM_BUNDLE_SUPPORT']}/tidy\" -f #{temp} -iq -utf8 \
              -wrap 0 --tab-size #{tab_size} --indent-spaces #{tab_size} \
        --indent yes \
              -asxhtml --output-xhtml yes \
              --enclose-text yes \
              --doctype strict \
        --wrap-php no \
              --tidy-mark no\""
    else
      # Need to check if tidy is installed before we move on...
      result = `which tidy`.strip
      context.exit_show_tool_tip "Tidy is not installed. Please install it first." if result.empty?
      cmd_line = "\"tidy\" -f /tmp/tm_tidy_errors -iq -utf8 \
              -wrap 0 --tab-size #{tab_size} --indent-spaces #{tab_size} \
        --indent yes \
              -asxhtml --output-xhtml yes \
              --enclose-text yes \
              --doctype strict \
        --wrap-php no \
              --tidy-mark no"
    end
    result = IO.popen(cmd_line, "r+") do |io|
      io << $stdin.read
      io.close_write # let the process know you've given it all the data 
      io.read
    end
    status = $?.exitstatus

    at_exit { File.unlink(temp) } # Clean up error log
    
    if status == 2 # Errors
    
      msg = "Errors: " + File.read(temp)
      context.exit_show_tool_tip msg # FIXME Have to do this our own way!
    
    elsif status == 1 # Warnings - use output but also display notification with warnings
      
      log = File.read(temp).to_a.select do |line|
        ! (ENV['TM_SELECTED_TEXT'] and (line.include?('Warning: missing <!DOCTYPE> declaration') or line.include?("Warning: inserting missing 'title' element")))
      end.join rescue nil
      
      unless log.empty?
        options = {
          :title   => "Tidy Warnings",
          :summary => "Warnings for tidying your document (press escape to close):",
          :log     => log
        }
        Ruble::UI.simple_notification(options)
      end
    
    end

    final_output = ""
    if ENV['TM_SOFT_TABS'] == "YES"
      final_output = result
    else
      in_pre = false
      result.each_line do |line|
        unless in_pre
          space, text = /( *)(.*)/m.match(line)[1..2]
          line = "\t" * (space.length / tab_size).floor + " "  * (space.length % tab_size) + text
        end
        
        final_output << line
      
        in_pre = true  if line.include?("<pre>")
        in_pre = false if line.include?("</pre>")
      end
    end
    final_output
  end
end
