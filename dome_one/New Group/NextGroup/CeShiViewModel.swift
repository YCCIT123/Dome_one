////
////  CeShiViewModel.swift
////  dome_one
////
////  Created by ehimac on 2024/7/23.
////
//
//import UIKit
//
//class CeShiViewModel: NSObject {
//
//    private var dataSource:[EHIListSectionConfigModel] = [EHIListSectionConfigModel]();
//
//    private var didID : Int = 0;
//
//    var didTwoAction: ((Int) -> Void)?
//
//    var dateArray: [CeShiButtonModel] = [
//        CeShiButtonModel(title: "政企", id: 1),
//        CeShiButtonModel(title: "个人", id: 2),
//        CeShiButtonModel(title: "杨程程", id: 3)
//    ];
//
//    private lazy var ceShiSection: CeShiSectionItem = {
//        let section = CeShiSectionItem.init();
//        section.getCell(model: dateArray, needRefresh: false);
////      cell点击事件
//        section.didAction = {[weak self] (id) in
//            if let dateArray = self?.dateArray {
//                for (index, buttonModel) in dateArray.enumerated() {
//                    let boolTF = (index == ((id ?? 0) - 1))
//                    buttonModel.textColor = boolTF ? .orange : .black;
//                    buttonModel.bdColor = boolTF ? .orange : EHIColor.hexColor_DDDDDD;
//                    buttonModel.imageUrl = boolTF ? "lowerRightCorner" : "";
//                    buttonModel.isSelected = boolTF;
//                    if boolTF { self?.didID = id ?? 0 };
//                }
//            }
//            self?.ceShiSection.getCell(model: self?.dateArray, needRefresh: true);
//        }
//        return section
//    }();
//
//    private lazy var ceShiTwoSection: CeShiTwoSectionItem = {
//        let section = CeShiTwoSectionItem.init();
//        section.didTwoAction = {[weak self] in
//            self?.didTwoAction?(self?.didID ?? 0);
//        }
//        return section;
//    }();
//
//    override init() {
//        super.init();
//        self.dataSource.append(EHIListSectionConfigModel.init(sectionItem: self.ceShiSection));
//        self.dataSource.append(EHIListSectionConfigModel.init(sectionItem: self.ceShiTwoSection));
//    }
//
//}
//
//// MARK: - IG
//extension CeShiViewModel:ListAdapterDataSource {
//    func objects(for listAdapter: ListAdapter) -> [ListDiffable] {
//        return self.dataSource;
//    }
//
//    func listAdapter(_ listAdapter: ListAdapter, sectionControllerFor object: Any) -> ListSectionController {
//        if let object = object as? EHIListSectionConfigModel {
//            return object.sectionItem ?? ListSectionController.init();
//        }
//        return ListSectionController.init();
//    }
//
//    func emptyView(for listAdapter: ListAdapter) -> UIView? {
//        return nil;
//    }
//}
//
