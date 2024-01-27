contract c18738{
 /************* HELPERS ****************/
 /**
  * only works for bytes of length < 32
  * @param b the byte input
  * @return the uint
  * */
 function toUint32(bytes b) internal pure returns(uint32) {
   bytes32 newB;
   assembly {
     newB := mload(0x80)
   }
   return uint32(newB);
 }
}