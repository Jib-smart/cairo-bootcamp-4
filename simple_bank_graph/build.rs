use cainome::rs::Abigen;
use std::collections::HashMap;

fn main() {
    // Aliases added from the ABI
    let mut aliases = HashMap::new();

    let simplebank_abigen =
        Abigen::new("simplebank", "./abi/simplebank_contract.abi.json").with_types_aliases(aliases).with_derives(vec!["serde::Serialize".to_string(), "serde::Deserialize".to_string()]);

        simplebank_abigen
            .generate()
            .expect("Fail to generate bindings")
            .write_to_file("./src/abi/simplebank_contract.rs")
            .unwrap();
}