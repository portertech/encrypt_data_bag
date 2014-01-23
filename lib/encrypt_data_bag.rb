require "encrypt_data_bag/version"
require "chef/encrypted_data_bag_item"

module EncryptDataBag
  class << self
    def is_json_file?(file)
      File.extname(file) == ".json"
    end

    def from_file(secret_file, input_file, output_file, options={})
      secret = Chef::EncryptedDataBagItem.load_secret(secret_file)
      input = IO.read(input_file)
      item = is_json_file?(input_file) ? JSON.parse(input) : eval(input)
      item = Hash[item.map { |k, v| [k.to_s, v] }]
      output = if options[:decrypt]
        Chef::EncryptedDataBagItem.new(item, secret).to_hash
      else
        Chef::EncryptedDataBagItem.encrypt_data_bag_item(item, secret)
      end
      File.open(output_file, "w") do |file|
        if is_json_file?(output_file)
          file.print(JSON.pretty_generate(output))
        else
          file.write(output.pretty_inspect)
        end
      end
    end
  end
end
