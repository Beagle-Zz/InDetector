contract c16609{
    // check is release record existed
    // if existed return true, else return false
    function checkIsReleaseRecordExist(uint256 timestamp) internal view returns(bool _exist) {
        bool exist = false;
        uint256 releaseIndex = uint256(timestamp.parseTimestamp().year) * 10000 + uint256(timestamp.parseTimestamp().month) * 100 + uint256(timestamp.parseTimestamp().day);
        if (releaseRecords[releaseIndex].releaseIndex == releaseIndex){
            exist = true;
        }
        return exist;
    }
}