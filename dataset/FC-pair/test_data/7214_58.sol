contract c7214{
    /// @dev from MakerDao medianizer contract
    function medianize(uint[] unsorted)
        view
        returns (uint)
    {
        uint numValidEntries;
        for (uint i = 0; i < unsorted.length; i++) {
            if (unsorted[i] != 0) {
                numValidEntries++;
            }
        }
        if (numValidEntries < minimumPriceCount) {
            revert();
        }
        uint counter;
        uint[] memory out = new uint[](numValidEntries);
        for (uint j = 0; j < unsorted.length; j++) {
            uint item = unsorted[j];
            if (item != 0) {    // skip zero (invalid) entries
                if (counter == 0 || item >= out[counter - 1]) {
                    out[counter] = item;  // item is larger than last in array (we are home)
                } else {
                    uint k = 0;
                    while (item >= out[k]) {
                        k++;  // get to where element belongs (between smaller and larger items)
                    }
                    for (uint l = counter; l > k; l--) {
                        out[l] = out[l - 1];    // bump larger elements rightward to leave slot
                    }
                    out[k] = item;
                }
                counter++;
            }
        }
        uint value;
        if (counter % 2 == 0) {
            uint value1 = uint(out[(counter / 2) - 1]);
            uint value2 = uint(out[(counter / 2)]);
            value = add(value1, value2) / 2;
        } else {
            value = out[(counter - 1) / 2];
        }
        return value;
    }
}