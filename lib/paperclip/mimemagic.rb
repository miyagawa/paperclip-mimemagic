require "paperclip/command_type_detector"
require "paperclip/media_type_spoof_detector"
require "paperclip/mimemagic/version"
require 'mimemagic'

module Paperclip
  module Mimemagic
    SENSIBLE_DEFAULT = 'application/octet-stream'

    def type_from_magic(file)
      MimeMagic.by_magic(File.open(file)) || SENSIBLE_DEFAULT
    rescue StandardError
      SENSIBLE_DEFAULT
    end
  end

  class ContentTypeDetector
    def type_from_file_command
      @type_from_file_command ||= Mimemagic.type_from_magic(@filename)
    end
  end

  class MediaTypeSpoofDetector
    def type_from_file_command
      Mimemagic.type_from_magic(@filename)
    end
  end
end
