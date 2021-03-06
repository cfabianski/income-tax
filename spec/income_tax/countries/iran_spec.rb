describe IncomeTax::Countries::Iran do
  subject(:result) { described_class.new(income: income, income_type: type) }
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 1000                         }
    its(:net_income)   { should be == 850                          }
    its(:taxes)        { should be == 150                          }
  end

  describe "from gross income of 10000" do
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 10000                        }
    its(:net_income)   { should be == 8500                         }
    its(:taxes)        { should be == 1500                         }
  end

  describe "from gross income of 100000" do
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == 100000                       }
    its(:net_income)   { should be == 85000                        }
    its(:taxes)        { should be == 15000                        }
  end

  describe "from gross income of 100000000" do
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(37, 200)            }
    its(:gross_income) { should be == 100000000                    }
    its(:net_income)   { should be == 81500000                     }
    its(:taxes)        { should be == 18500000                     }
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
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == "1176.47058823529412".to_d   }
    its(:net_income)   { should be == 1000                         }
    its(:taxes)        { should be == "176.470588235294118".to_d   }
  end

  describe "from net income of 10000" do
    let(:type)         { :net                                      }
    let(:income)       { 10000                                     }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == "11764.705882352941".to_d    }
    its(:net_income)   { should be == 10000                        }
    its(:taxes)        { should be == "1764.70588235294118".to_d   }
  end

  describe "from net income of 100000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000                                    }
    its(:rate)         { should be == Rational(3, 20)              }
    its(:gross_income) { should be == "117647.058823529412".to_d   }
    its(:net_income)   { should be == 100000                       }
    its(:taxes)        { should be == "17647.0588235294118".to_d   }
  end

  describe "from net income of 100000000" do
    let(:type)         { :net                                      }
    let(:income)       { 100000000                                 }
    its(:rate)         { should be == Rational(37, 187)            }
    its(:gross_income) { should be == "124666666.666666667".to_d   }
    its(:net_income)   { should be == 100000000                    }
    its(:taxes)        { should be == "24666666.6666666667".to_d   }
  end
end
