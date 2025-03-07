require "./detectors/*"
require "../models/detector"

macro defind_detectors(detectors)
  {% for detector, index in detectors %}
    instance = {{detector}}.new(options)
    instance.set_name
    detector_list << instance
  {% end %}
end

def detect_techs(base_path : String, options : Hash(Symbol, String))
  techs = [] of String
  detector_list = [] of Detector
  defind_detectors([
    DetectorCrystalKemal, DetectorGoEcho, DetectorJavaJsp, DetectorJavaSpring,
    DetectorJsExpress, DetectorPhpPure, DetectorPythonDjango, DetectorPythonFlask,
    DetectorRubyRails, DetectorRubySinatra, DetectorSwagger,
  ])
  Dir.glob("#{base_path}/**/*") do |file|
    spawn do
      next if File.directory?(file)
      content = File.read(file, encoding: "utf-8", invalid: :skip)

      detector_list.each do |detector|
        if detector.detect(file, content)
          techs << detector.name
        end
      end
    end
    Fiber.yield
  end

  techs.uniq
end
