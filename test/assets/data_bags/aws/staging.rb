{
  :id => "staging",
  :aws_access_key_id => "foo",
  :aws_secret_access_key => "bar",
  :aws_x509_certificate => IO.read("test/assets/aws_x509_certificate.crt"),
  :aws_private_key => IO.read("test/assets/aws_private_key.pem")
}
