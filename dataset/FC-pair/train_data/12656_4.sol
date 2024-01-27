contract c12656{
  /**
* @dev Parse a floating point number from String to uint, e.g. "250.56" to "25056"
 */
function parse(string s)
internal constant
returns (uint256)
{
bytes memory b = bytes(s);
uint result = 0;
for (uint i = 0; i < b.length; i++) {
    if (b[i] >= 48 && b[i] <= 57) {
        result = result * 10 + (uint(b[i]) - 48);
    }
}
return result;
}
}