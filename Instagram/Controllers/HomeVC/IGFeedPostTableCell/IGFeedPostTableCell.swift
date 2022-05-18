//
//  IGFeedPostTableCell.swift
//  Instagram
//
//  Created by Ravi Dwivedi on 18/05/22.
//

import UIKit

class IGFeedPostTableCell: UITableViewCell {
    static let identifier = "IGFeedPostTableCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier:String?){
        super.init(style: style, reuseIdentifier: IGFeedPostTableCell.identifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(){
        //Configure
    }
    
}
