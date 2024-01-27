contract c12709{
  //function for updating an ad
  function update(uint _idx, string _title, string _link, string _ipfsHash) public {
    //get add with index from parameter
    Ad storage ad = ads[_idx];
    require(msg.sender == ad.owner || msg.sender == contractOwner);
    //set parameters to repalce the old content
    ad.link = _link;
    ad.ipfsHash = _ipfsHash;
    ad.title = _title;
    //trigger transaction without cost
    emit Update(_idx, ad.link, ad.ipfsHash, ad.title);
  }
}