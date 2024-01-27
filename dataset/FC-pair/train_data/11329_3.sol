contract c11329{
    // Converts _tileId to (x, y)
    function fromTileId(uint16 _tileId) pure public returns (uint8, uint8) {
        uint8 y = uint8(_tileId);
        uint8 x = uint8(_tileId >> 8);
        return (x, y);
    }
}