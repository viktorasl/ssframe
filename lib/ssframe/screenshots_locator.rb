module Ssframe
  class ScreenshotsLocator

    def self.localization_dirs(dir)
      Dir.entries(dir).select do |entry|
        is_dir = File.directory?(File.join(dir, entry))
        is_nav = (entry == '.' || entry == '..')
        is_dir && !is_nav
      end
    end

    def self.structure_in_directory(dir, devices_config)
      supported_config = devices_config.map { |k, _| k }
      localization_dirs(dir).flat_map do |lang_dir|
        abs_dir = File.join(dir, lang_dir)
        formed_config = Dir["#{abs_dir}/*.png"].map do |ss|
          base_ss = File.basename(ss, ".*")
          device = supported_config.select { |c| base_ss.start_with?("#{c}-") }.first
          if device == nil
            nil
          else
            base_ss.slice!("#{device}-")
            [lang_dir, device, base_ss, ss]
          end
        end
        formed_config.select { |e| e != nil }
      end
    end
  end
end
