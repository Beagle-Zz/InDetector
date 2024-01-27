contract c11669{
  // Get the bounding box (in metres) of this parcel
  function getBoundingBox(uint256 _tokenId) public view returns (int16, int16, int16, int16, int16, int16) {
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