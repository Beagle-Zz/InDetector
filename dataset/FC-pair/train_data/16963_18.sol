contract c16963{
    // returns true if the bytes located in txBytes by pos and
    // script_len represent a P2SH script
    function isP2SH(bytes txBytes, uint pos, uint script_len) returns (bool) {
        return (script_len == 23)           // 20 byte scripthash + 3 bytes of script
            && (txBytes[pos + 0] == 0xa9)   // OP_HASH160
            && (txBytes[pos + 1] == 0x14)   // bytes to push
            && (txBytes[pos + 22] == 0x87); // OP_EQUAL
    }
}