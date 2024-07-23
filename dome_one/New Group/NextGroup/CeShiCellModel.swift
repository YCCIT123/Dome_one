//
//  CeShiCellModel.swift
//  dome_one
//
//  Created by ehimac on 2024/7/23.
//

import UIKit

class CeShiCellModel: EHIListBaseCellModel {

    /**ID**/
    var id: Int = 0;
    /**用途的按钮**/
    var title: String = "";
    /**用途的按钮的frame**/
    var buttonFrame: CGRect?
    /**按钮右下角的图片**/
    var imageFrame: CGRect?
    /**判断是否选中**/
    var isSelected:Bool?
    /**样式边框颜色**/
    var bdColor: UIColor?
    /**样式字体颜色**/
    var textColor: UIColor?
    /**被选中图片**/
    var imageUrl: String = "";
    //点击事件
    var didAction: ((Int?) -> Void)?
    // 刷新
    var refreshAction:((_ cellModel:CeShiCellModel?) -> Void)?;

    init(cellWidth: CGFloat,model: CeShiButtonModel) {
        super.init();
    }

    override func seed_CellClass() -> AnyClass {
        return CeShiCell.self;
    }

    override func seed_CellNibName() -> String {
        return "CeShiCell";
    }

}
    
// 获取frame和更新数据
extension CeShiCellModel {

    func getFrame(cellWidth: CGFloat) -> CGFloat {
        let maxWidth = cellWidth - 12;
        let buttonH = self.title.ehi_height(font: fRegular14, maxWidth: maxWidth) + 16;
        self.buttonFrame = CGRect(x: 6, y: 5, w: maxWidth, h: buttonH);
        self.imageFrame = CGRect(x: maxWidth - 26, y: 12, w: 26, h: 21);
        return buttonH + 10;
    }

    func getCell(model: CeShiButtonModel?,cellWidth: CGFloat) {
        self.id = model?.id ?? 0;
        self.title = model?.title ?? "";
        self.bdColor = model?.bdColor;
        self.textColor = model?.textColor;
        self.imageUrl = model?.imageUrl ?? "";
        self.isSelected = model?.isSelected;
        self.seed_cellSize = .init(width: cellWidth, height: getFrame(cellWidth: cellWidth))

        //        self.refreshAction?(self);
    }
        
}
