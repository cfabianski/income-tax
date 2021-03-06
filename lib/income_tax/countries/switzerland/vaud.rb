module IncomeTax
  module Countries
    class Switzerland
      class Vaud < Canton
        register "Vaud", "VD"
        lazy { @levels = Marshal.load(File.open("#{__dir__}/data/vaud.dat")) }
        municipal_multiplier "110%"
      end
    end
  end
end
