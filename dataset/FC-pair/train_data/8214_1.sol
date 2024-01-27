contract c8214{
    // If a mistake is done during upload, reverse using erase()
    function erase(uint _entriesToDelete) onlyOwner readWrite public {
        require(_entriesToDelete != 0);
        if(data.length < _entriesToDelete) { 
            delete data;
        }
        else data.length -= _entriesToDelete;
        remainder = 0;
    }
}