contract c2087{
	  /// Requires the amount of Ether be at least or more of the currentPrice
	  /// @dev Creates an instance of an token and mints it to the purchaser
	  /// @param _type The token type as an integer
	  /// @param _title The short title of the token
	  /// @param _description Description of the token
	  function buyToken (
		uint256 _type,
		string _title,
		string _description
	  ) external payable {
		bytes memory _titleBytes = bytes(_title);
		require(_titleBytes.length >= TITLE_MIN_LENGTH, "Title is too short");
		require(_titleBytes.length <= TITLE_MAX_LENGTH, "Title is too long");
		bytes memory _descriptionBytes = bytes(_description);
		require(_descriptionBytes.length >= DESCRIPTION_MIN_LENGTH, "Description is too short");
		require(_descriptionBytes.length <= DESCRIPTION_MAX_LENGTH, "Description is too long");
		require(msg.value >= currentPrice, "Amount of Ether sent too small");
		uint256 index = allTokens.length + 1;
		_mint(msg.sender, index);
		tokenTypes[index] = _type;
		tokenTitles[index] = _title;
		tokenDescription[index] = _description;
		emit BoughtToken(msg.sender, index);
	  }
}