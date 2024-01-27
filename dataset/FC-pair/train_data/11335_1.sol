contract c11335{
    // Checks if two coordinates are adjacent:
    // xxx
    // xox
    // xxx
    // All x (_x2, _xy2) are adjacent to o (_x1, _y1) in this ascii image. 
    // Adjacency does not wrapp around map edges so if y2 = 255 and y1 = 0 then they are not ajacent
    function isAdjacent(uint8 _x1, uint8 _y1, uint8 _x2, uint8 _y2) pure public returns (bool) {
        return ((_x1 == _x2 &&      (_y2 - _y1 == 1 || _y1 - _y2 == 1))) ||      // Same column
               ((_y1 == _y2 &&      (_x2 - _x1 == 1 || _x1 - _x2 == 1))) ||      // Same row
               ((_x2 - _x1 == 1 &&  (_y2 - _y1 == 1 || _y1 - _y2 == 1))) ||      // Right upper or lower diagonal
               ((_x1 - _x2 == 1 &&  (_y2 - _y1 == 1 || _y1 - _y2 == 1)));        // Left upper or lower diagonal
    }
}