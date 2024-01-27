contract c4226{
/**
* @dev gets freezing end date and freezing balance for the freezing portion specified by index.
* @param _addr Address of freeze tokens owner.
* @param _index Freezing portion index. It ordered by release date descending.
*/
function getFreezing(address _addr, uint _index) public view returns (uint64 _release, uint _balance) {
for (uint i = 0; i < _index + 1; i++) {
_release = chains[toKey(_addr, _release)];
if (_release == 0) {
return;
}
}
_balance = freezings[toKey(_addr, _release)];
}
}