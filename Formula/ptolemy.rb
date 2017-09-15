class Ptolemy < Formula
  include Language::Python::Virtualenv

  desc "Write terse AWS DMS table mappings."
  homepage "https://github.com/cloudreach/ptolemy"
  url "https://github.com/cloudreach/ptolemy/archive/v1.0.0.tar.gz"
  sha256 "9ed81174b1b8728042a3ed71dde09662504df20ead0dc21dc996614f5341e908"

  resource "functools32" do
    url "https://files.pythonhosted.org/packages/c5/60/6ac26ad05857c601308d8fb9e87fa36d0ebf889423f47c3502ef034365db/functools32-3.2.3-2.tar.gz"
    sha256 "f6253dfbe0538ad2e387bd8fdfd9293c925d63553f5813c4e587745416501e6d"
  end

  resource "jsonschema" do
    url "https://files.pythonhosted.org/packages/58/0d/c816f5ea5adaf1293a1d81d32e4cdfdaf8496973aa5049786d7fdb14e7e7/jsonschema-2.5.1.tar.gz"
    sha256 "36673ac378feed3daa5956276a829699056523d7961027911f064b52255ead41"
  end

  resource "ptolemy" do
    url "https://files.pythonhosted.org/packages/54/ba/a821e8cd33bdab1a8a8b0c36899bdc8c7445ce48647e5c47857be9c4e650/ptolemy-1.0.0.tar.gz"
    sha256 "77fe5d2d656bfbcfe74b0c36f7340ac595aeae76e757da31f470522178f78db8"
  end

  resource "PyYAML" do
    url "https://files.pythonhosted.org/packages/75/5e/b84feba55e20f8da46ead76f14a3943c8cb722d40360702b2365b91dec00/PyYAML-3.11.tar.gz"
    sha256 "c36c938a872e5ff494938b33b14aaa156cb439ec67548fcab3535bb78b0846e8"
  end

  def install
    virtualenv_install_with_resources
    bin.install libexec/"bin/ptolemy"
  end

  test do
    (testpath/"input.yaml").write <<-EOS.undent
      selection:
        include:
          -
            object-locators:
              schema-names:
                - Test
              table-names:
                - "%"
      EOS
    assert_match "Test", shell_output("#{bin}/ptolemy #{testpath}/input.yaml")
  end
end
