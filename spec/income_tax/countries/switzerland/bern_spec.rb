describe IncomeTax::Countries::Switzerland::Bern do
  subject(:result) { IncomeTax::Countries::Switzerland.new(income: income, income_type: type, canton: 'Bern') }
  let(:type) { :gross }

  describe "from gross income of 0" do
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 1000" do
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 0                            }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(23, 125)            }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == "81599.5954".to_d            }
    its(:taxes)        { should be == "18400.4046".to_d            }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(264, 311)           }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == "15113026.3338".to_d         }
    its(:taxes)        { should be == "84886973.6662".to_d         }
  end

  describe "from net income of 0" do
    let(:type)         { :net                                      }
    let(:income)       { 0                                         }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 0                            }
    its(:net_income)   { should be == 0                            }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 1000" do
    let(:type)         { :net                                      }
    let(:income)       { 1000                                      }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(0, 1)               }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == 0                            }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(44, 249)            }
    its(:gross_income) { should be == "121463.095389469886366602".to_d }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "21463.095389469886366602".to_d }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(71, 126)            }
    its(:gross_income) { should be == "229094609.1708563598550704".to_d }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "129094609.1708563598550704".to_d }
  end
end
