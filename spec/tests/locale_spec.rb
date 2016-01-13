require 'spec_helper'

# rspec spec/tests/locale_spec.rb
describe "Locale interpret" do
  klass = GeoLocale

  lv_ip = LV_IPS.sample
  lt_ip = LT_IPS.sample
  ee_ip = EE_IPS.sample
  ru_ip = RU_IPS.sample
  us_ip = US_IPS.sample
  gb_ip = GB_IPS.sample
  ir_ip = IR_IPS.sample
  ie_ip = IE_IPS.sample
  pl_ip = PL_IPS.sample

  before :each do
    GeoLocale.config = nil
    GeoLocale.configure {}
  end

  describe ".locale (ip: "", country_code: nil, lcid: false)" do
    describe "from country code" do
      context "with unchanged defaults" do
        it "should return en if no arguments given" do
          expect( klass.locale(country_code: "") ).to eq "en"
        end
        it 'should return lv for country_code: "lv"' do
          expect( klass.locale(country_code: "lv") ).to eq "lv"
        end
        it 'should return en for country_code: "gb"' do
          expect( klass.locale(country_code: "gb") ).to eq "en"
        end
        it 'should return en-gb for country_code: "gb", lcid: true' do
          expect( klass.locale(country_code: "gb", lcid: true) ).to eq "en-gb"
        end
      end
      context "with customized config" do
        it "should return de if no arguments given" do
          klass.config.default_locale = "ch"
          puts klass.config.inspect
          expect( klass.locale(country_code: "") ).to eq "ch"
        end
        it 'should return lv for country_code: "lv"' do
          klass.config.default_country = "de"
          expect( klass.locale(country_code: "lv") ).to eq "lv"
        end
        it 'should return en for country_code: "gb"' do
          klass.config.default_country = "de"
          expect( klass.locale(country_code: "gb") ).to eq "en"
        end
        it 'should return en-gb for country_code: "gb", lcid: true' do
          klass.config.default_country = "de"
          expect( klass.locale(country_code: "gb", lcid: true) ).to eq "en-gb"
        end
      end
    end

    describe "from IP" do
      context "with unchanged defaults" do
        it "should return en if no arguments given" do
          expect( klass.locale(ip: "") ).to eq "en"
        end
        it "should return lv for #{lv_ip}" do
          expect( klass.locale(ip: lv_ip) ).to eq "lv"
        end
        it "should return en for #{us_ip} " do
          expect( klass.locale(ip: us_ip) ).to eq "en"
        end
        it "should return en-ie for #{ie_ip}, lcid: true" do
          expect( klass.locale(ip: ie_ip, lcid: true) ).to eq "en-ie"
        end
      end
      context "with customized config" do
        it "should return en if only default_contry configured and no arguments given" do
          klass.config.default_country = "no"
          expect( klass.locale(ip: "") ).to eq "en"
        end
        it "should return en if only default_locale configured and no arguments given" do
          klass.config.default_locale = "no"
          expect( klass.locale(ip: "") ).to eq "en"
        end
        it 'should return "no" if both defaults configured and no arguments given' do
          klass.config.default_country = "no"
          klass.config.default_locale = "no"
          expect( klass.locale(ip: "") ).to eq "no"
        end
        it "should return lv for #{lv_ip}" do
          klass.config.default_country = "no"
          klass.config.default_locale = "no"
          expect( klass.locale(ip: lv_ip) ).to eq "lv"
        end
        it "should return en for #{gb_ip}" do
          klass.config.default_country = "no"
          klass.config.default_locale = "no"
          expect( klass.locale(ip: gb_ip) ).to eq "en"
        end
        it "should return en-ie for #{ie_ip}, lcid: true" do
          klass.config.default_country = "no"
          klass.config.default_locale = "no"
          expect( klass.locale(ip: ie_ip, lcid: true) ).to eq "en-ie"
        end
        it "should return lt for #{lt_ip}, lcid: true" do
          klass.config.default_country = "no"
          klass.config.default_locale = "no"
          expect( klass.locale(ip: lt_ip, lcid: true) ).to eq "lt"
        end
      end
    end
  end

  # privates
  describe ".get_locale_or_lcid(country_code: nil, lcid: false)" do
    it "should return default countries locale if passed nothing" do
      expect(klass.get_locale_or_lcid).to eq klass.config.default_locale
    end

    it "should return default countries locale if passed nil country_code" do
      expect(klass.get_locale_or_lcid(country_code: nil)).to eq klass.config.default_locale
    end

    it "should return default countries locale if passed empty country_code string" do
      expect(klass.get_locale_or_lcid(country_code: "")).to eq klass.config.default_locale
    end
  end

end
