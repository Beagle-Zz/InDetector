contract c11328{
    // Converts (x, y) to tileId xy
    function toTileId(uint8 _x, uint8 _y) pure public returns (uint16) {
        return uint16(_x) << 8 | uint16(_y);
    }
}