contract c8698{
    // If a mistake is done during upload, reverse using erase()
    function erase(uint _entriesToDelete) public {
        require(msg.sender == owner);
        require(readOnly != true);
        if(data.length < _entriesToDelete) { 
            delete data;
        }
        else data.length -= _entriesToDelete;
        remainder = 0;
    }
}