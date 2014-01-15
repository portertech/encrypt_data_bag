require "encrypt_data_bag/version"
require "chef/encrypted_data_bag_item"

module EncryptDataBag
  class << self
    def is_json_file?(file)
      File.extname(file) == ".json"
    end

    def from_file(secret_file, input_file, output_file)
      secret = Chef::EncryptedDataBagItem.load_secret(secret_file)
      raw_item = IO.read(input_file)
      item = is_json_file?(input_file) ? JSON.parse(raw_item) : eval(raw_item)
      encrypted_item = Chef::EncryptedDataBagItem.encrypt_data_bag_item(item, secret)
      File.open(output_file, "w") do |file|
        if is_json_file?(output_file)
          file.print(JSON.pretty_generate(encrypted_item))
        else
          file.write(encrypted_item.pretty_inspect)
        end
      end
    end
  end
end
