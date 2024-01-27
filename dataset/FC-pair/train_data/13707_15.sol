contract c13707{
    // scan the full transaction bytes and return the first two output
    // values (in satoshis) and addresses (in binary)
    function getFirstTwoOutputs(bytes txBytes)
             returns (uint, bytes20, uint, bytes20)
    {
        uint pos;
        uint[] memory input_script_lens = new uint[](2);
        uint[] memory output_script_lens = new uint[](2);
        uint[] memory script_starts = new uint[](2);
        uint[] memory output_values = new uint[](2);
        bytes20[] memory output_addresses = new bytes20[](2);
        pos = 4;  // skip version
        (input_script_lens, pos) = scanInputs(txBytes, pos, 0);
        (output_values, script_starts, output_script_lens, pos) = scanOutputs(txBytes, pos, 2);
        for (uint i = 0; i < 2; i++) {
            var pkhash = parseOutputScript(txBytes, script_starts[i], output_script_lens[i]);
            output_addresses[i] = pkhash;
        }
        return (output_values[0], output_addresses[0],
                output_values[1], output_addresses[1]);
    }
}