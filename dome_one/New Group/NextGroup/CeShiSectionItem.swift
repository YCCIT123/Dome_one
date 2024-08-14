////
////  CeShiSectionItem.swift
////  dome_one
////
////  Created by ehimac on 2024/7/23.
////
//
//import UIKit
//
//class CeShiSectionItem: EHIListBindingSectionController {
//
//    var didAction:((Int?) -> Void)?
//
//    override init () {
//        super.init();
//        self.sectionInit();
//        self.inset = .init(top: 34, left: 12, bottom: 0, right: 12)
//    }
//
//    func getCell(model: [CeShiButtonModel]? , needRefresh: Bool) {
//        self.cellModels?.removeAllObjects()
//        if let model = model,  model.count > 0 {
//            for item in model {
//                let cell = CeShiCellModel.init(cellWidth: self.getSectionWidth() / 2 , model: item);
//                cell.didAction = {[weak self] id in
//                    self?.didAction?(id);
//                }
//                cell.getCell(model: item, cellWidth: self.getSectionWidth() / 2);
//                self.cellModels?.append(cell);
//            }
//        }
//        needRefresh ? self.section_reload() : nil;
//    }
//}
//
