$targets = @("stm32c011f6", "stm32f051r8", "stm32f429zi", "stm32g031k8", "stm32g431kb", "stm32l432kc", "stm32u545re")

mkdir output -ErrorAction SilentlyContinue

# For each target, call cargo
foreach ($target in $targets) {
    $output = cargo $target --release --test example_test --no-run --message-format=json

    # parse json output of second to last line
    $json = $output[-2] | ConvertFrom-Json
    cp $json.executable "output/$target"
}
