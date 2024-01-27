contract c3508{
  //Get any token metadata by passing in the ID
  function get(uint256 _id) public view returns (address owner,uint8 body,uint8 feet,uint8 head,uint8 mouth,uint64 birthBlock) {
    return (
      tokenOwner[_id],
      tokens[_id].body,
      tokens[_id].feet,
      tokens[_id].head,
      tokens[_id].mouth,
      tokens[_id].birthBlock
    );
  }
}