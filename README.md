# Noir Primer

Repository with some simple examples of Noir code to show the basics of the language.

## Installation

To install the necessary tool to compile and execute Noir code, run the following command:

```bash
curl -L https://raw.githubusercontent.com/noir-lang/noirup/main/install | bash
```

It will install noirup on your system. You can then close your terminal and open it again. And then run noirup

```bash
noirup
```

It will install the latest stable version of Noir. You can also install a specific version of Noir by running:

```bash
noirup -v <version>
```

Or if you the want the nightly version (unstable but latest features), you can also run:

```bash
noirup -n
```

## Usage

First `cd` to the folder you want to work with.

### Generate proof

Then to generate a proof run the following command:

```bash
# name_of_proof could be just p for example
nargo prove <name_of_proof>
```

It will create a proofs folder where you will your proof.

If you want to show the output for println in your terminal, make sure to add the
`show-output` flag:

```bash
nargo prove --show-output <name_of_proof>
```

### Verify proof

To verify the proof. Run the following command:

```bash
nargo verify <name_of_proof>
```

### Changing inputs to circuit

If you want to change the inputs to the prover, you can do so by editing the Prover.toml file. And for the verify you can do so by editing the Verifier.toml file. However this one will be autocompleted after you generate the proof with `nargo prove`.
