##
# IRB initialization
# https://ruby-doc.org/stdlib/libdoc/irb/rdoc/IRB.html

#IRB.conf[:USE_AUTOCOMPLETE] = false

# https://github.com/amazing-print/amazing_print
if Dir.exist? File.join(Dir.home, 'code/amazing_print/lib/amazing_print')
  # Load from local source code
  require File.join(Dir.home, 'code/amazing_print/lib/amazing_print')
else
  require 'amazing_print'
end

AmazingPrint.defaults = {
  indent: 2,
  ruby19_syntax: true,
  sort_keys: true
}
AmazingPrint.irb!
