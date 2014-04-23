require "paperclip/content_type_detector"
require "paperclip/media_type_spoof_detector"
require "paperclip/mimemagic/version"
require "mimemagic"

module Paperclip
  module Mimemagic
    def self.type_from_magic(file)
      magic = MimeMagic.by_magic(File.open(file))
      if magic
        magic.type
      else
        nil
      end
    rescue StandardError
      nil
    end

    def self.patch
      Paperclip::ContentTypeDetector.class_eval do
        def type_from_file_command
          @type_from_file_command ||= Mimemagic.type_from_magic(@filename)
        end
      end
      Paperclip::MediaTypeSpoofDetector.class_eval do
        def type_from_file_command
          Mimemagic.type_from_magic(@file.path) || ""
        end
      end
    end
  end
end
