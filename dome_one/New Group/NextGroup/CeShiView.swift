//
//  CeShiView.swift
//  dome_one
//
//  Created by ehimac on 2024/7/23.
//

import UIKit

class CeShiView: UIView {

    /**弹框的tool*/
    private lazy var tool:SEEDPopAlertTool = {
        let tool = SEEDPopAlertTool();
        tool.dismissComplete = { [weak self] in
        };
        tool.popBGAlpha = 0.4;
        return tool;
    }();

    /**顶部视图*/
    private lazy var headerView:EHICustomAlertHeaderView = {
        let view = EHICustomAlertHeaderView.init(frame: .zero, title: "租车用途") { [weak self] in
            self?.hidden();
        };
        return view;
    }();
    /**adapter*/
    private lazy var bodyAdapter:ListAdapter = {
        let adapter = ListAdapter.init(updater: ListAdapterUpdater.init(), viewController: UIViewController());
        return adapter;
    }();
    /**bodycollectionView*/
    private lazy var bodyCollectionView:ListCollectionView = {
        let collectionView = EHICollectionViewCreateUtil.createForIGList(adapter: self.bodyAdapter, frame: .init(origin: .zero, size: .init(width: kEHIScreenWidth, height: 0)), backgroundColor: EHIColor.hexColor_FFFFFF_fitDark_1F1F1F, viewController: self.context);
        self.bodyAdapter.collectionView = collectionView;
        self.bodyAdapter.dataSource = self.bodyViewModel;
        return collectionView;
    }();
    /**collectionViewModel*/
    private lazy var bodyViewModel:CeShiViewModel = { [weak self] in
        let viewModel = CeShiViewModel.init();
        viewModel.didTwoAction = {[weak self] number in
            if number == 1 {
                let vc = EHIFAQQuestionAskViewController();
                self?.context?.navigationController?.pushViewController(vc, animated: true)
                print("我是界面1");
            } else if number == 2 {
                let vc = EHIFAQQuestionListViewController();
                self?.context?.navigationController?.pushViewController(vc, animated: true)
                print("我是界面2");
            } else {
                Utils.showMessage("请选择租车用途");
            }
        }
        return viewModel;
    }();

    /**保存的vc**/
    private weak var context:UIViewController?;

    init(frame: CGRect, context:UIViewController?) {
        super.init(frame: frame);
        self.context = context;
        self.setupSubviews();
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: 视图相关
extension CeShiView {
    /**设置子视图*/
    private func setupSubviews() {
        self.backgroundColor = EHIColor.hexColor_FFFFFF_fitDark_1F1F1F;
        self.layer.mask = EHILayerCreateUtil.createRoundCornerLayer(roundedRect: .init(origin: .zero, size: .init(width: kEHIScreenWidth, height: kEHIScreenHeight)), roundingCorners: UIRectCorner.init(rawValue: (UIRectCorner.topLeft.rawValue | UIRectCorner.topRight.rawValue)), cornerRadii: .init(width: 16, height: 16), layerFrame: .init(origin: .zero, size: .init(width: kEHIScreenWidth, height: kEHIScreenHeight)));

        self.addSubview(self.headerView);
        self.addSubview(self.bodyCollectionView);

        self.headerView.snp_makeConstraints { (make) in
            make.top.equalToSuperview().offset(8);
            make.left.right.equalToSuperview();
            make.height.equalTo(44);
        }
        self.bodyCollectionView.snp_makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.headerView.snp_bottom);
            make.height.equalTo(44);
        }
        self.bodyCollectionView.snp_makeConstraints { (make) in
            make.left.right.equalToSuperview()
            make.top.equalTo(self.bodyCollectionView.snp_bottom);
            make.bottom.equalToSuperview().offset(-kEHISafeBottomHeight);
        }
    }
}

//MARK: extension SEEDPopAlertLayoutDelegate
extension CeShiView : SEEDPopAlertLayoutDelegate {
    /**展示*/
    @objc func show(_ vc: UIViewController) {
        self.tool.pop(Super: vc, Custom: self);
    }

    func alertViewFinallyFrame() -> CGRect {
        return self.frame;
    }

    /**隐藏*/
    func hidden() {
        self.tool.dismiss(complete: nil);
    }
}
