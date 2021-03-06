module IncomeTax
  module Countries
    class Switzerland
      class Ticino < Canton
        register "Ticino", "TI"
        lazy { @levels = Marshal.load(File.open("#{__dir__}/data/ticino.dat")) }
        municipal_multiplier "95%"
      end
    end
  end
end
