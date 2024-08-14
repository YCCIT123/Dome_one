////
////  CeShiCell.swift
////  dome_one
////
////  Created by ehimac on 2024/7/23.
////
//
//import UIKit
//
//class CeShiCell: UICollectionViewCell {
//        var cellModel: CeShiCellModel?
//    
//        private lazy var btn: UIButton = {
//            let btn = UIButton();
//            return btn;
//        }();
//    
//        private lazy var img: UIImageView = {
//            let img = UIImageView();
//            return img;
//        }();
//    
//        override init(frame: CGRect) {
//            super.init(frame: frame);
//            setUI();
//        }
//    
//        required init?(coder: NSCoder) {
//            fatalError("init(coder:) has not been implemented");
//        }
//    }
//    
//    // UI
//    extension CeShiCell {
//        private func setUI() {
//            self.contentView.addSubview(btn);
//            self.btn.addSubview(img);
//            btn.addTarget(self, action: #selector(didButtonAction), for: .touchUpInside)
//        }
//    }
//    
//    //点击Action
//    extension CeShiCell {
//        @objc func didButtonAction() {
//            cellModel?.didAction?(cellModel?.id);
//        }
//    }
//    
//    
//    // IG数据
//    extension CeShiCell: ListBindable{
//        func bindViewModel(_ viewModel: Any) {
//            if let cellModel = viewModel as? CeShiCellModel {
//                self.cellModel = cellModel;
//    
//                self.btn.setTitle(cellModel.title, for: .normal);
//                self.btn.frame = cellModel.buttonFrame ?? .zero;
//                self.btn.layer.borderColor = cellModel.bdColor?.cgColor;
//                self.btn.setTitleColor(cellModel.textColor, for: .normal);
//                self.btn.layer.cornerRadius = 4;
//                self.btn.layer.borderWidth = 0.4;
//                self.btn.titleLabel?.font = fRegular14;
//    
//                self.img.image = UIImage(named: cellModel.imageUrl);
//                self.img.frame = cellModel.imageFrame ?? .zero;
//                
//            }
//        }
//}
