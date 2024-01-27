contract c16425{
  // Get the bounding box (in metres) of this property
  function getBoundingBox(uint256 _tokenId) public view returns (uint, uint, uint, uint, uint, uint) {
    require(exists(_tokenId));
    return (
      boundingBoxes[_tokenId].x1, 
      boundingBoxes[_tokenId].y1, 
      boundingBoxes[_tokenId].z1,
      boundingBoxes[_tokenId].x2, 
      boundingBoxes[_tokenId].y2, 
      boundingBoxes[_tokenId].z2
    );
  }
}