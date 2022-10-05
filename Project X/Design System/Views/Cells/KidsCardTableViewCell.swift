//
//  KidsCardTableViewCell.swift
//  Project X
//
//  Created by Nataliya Lazouskaya on 26.09.22.
//

import UIKit

final class KidsCardTableViewCell: UITableViewCell {
    private let backgroundCell:UIView = {
        let view = UIView()
        view.backgroundColor = .accentStatus
        view.layer.cornerRadius = LayoutConstants.cornerRadius8
        view.layer.borderWidth = LayoutConstants.borderWidth
        view.layer.borderColor = UIColor.primaryMidnight.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = LayoutConstants.cornerRadius36
        view.backgroundColor = .primaryWhiteSnow
        view.layer.borderWidth = LayoutConstants.borderWidth
        view.layer.borderColor = UIColor.primaryMidnight.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let kidsImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "boy")//?.withRenderingMode(.alwaysTemplate)
        view.layer.cornerRadius = LayoutConstants.cornerRadius27
        view.layer.borderWidth = LayoutConstants.borderWidth
        view.layer.borderColor = UIColor.primaryMidnight.cgColor
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let kidNameLabel: UILabel = {
        let label = UILabel()
        label.text = "Борис"
        label.font = UIFont.nexaDemoBold16()
        label.textColor = .darkTextColor
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    private let greenImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "green")
        view.clipsToBounds = true
        view.contentMode = .scaleAspectFit
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let doneImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(named: "done")
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    private let tasksLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.robotoRegular12()
        label.textColor = .primaryMidnight
        label.text = "2/6 задач"
        label.numberOfLines = 1
        label.sizeToFit()
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setConstraints()
    }
    override func layoutSubviews() {
        kidsImageView.layer.cornerRadius = LayoutConstants.cornerRadius27
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func cellConfigure(data:KidsData) {
        kidNameLabel.text = data.name
        tasksLabel.text = "\(data.numberOfTasksDone)/\(data.numberOfTasks) задач"
        addProgress(view: circleView, tasks: data.numberOfTasks, tasksDone: data.numberOfTasksDone)
    }
}

//MARK: - Private extension
private extension KidsCardTableViewCell {
    func setupViews() {
        backgroundColor = .clear
        selectionStyle = .none
        addSubview(backgroundCell)
        addSubview(circleView)
        addSubview(kidsImageView)
        addSubview(kidNameLabel)
        addSubview(greenImageView)
        addSubview(doneImageView)
        addSubview(tasksLabel)
    }
    func addProgress(view: UIView, tasks: Int, tasksDone: Int) {
        let center = LayoutConstants.centerBezier
        let startAngle:CGFloat = (-CGFloat.pi) / 2
        let endAngle:CGFloat = startAngle + (2 * CGFloat.pi)
        let circularPath = UIBezierPath(arcCenter: center, radius: LayoutConstants.radiusBezier, startAngle: startAngle, endAngle: endAngle, clockwise: true)
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = circularPath.cgPath
        shapeLayer.lineWidth = LayoutConstants.lineWidthBezier
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.strokeEnd = (CGFloat(tasksDone) / CGFloat(tasks))
        shapeLayer.lineCap = .round
        shapeLayer.strokeColor = UIColor.primaryJuicyGrape.cgColor
        view.layer.addSublayer(shapeLayer)
    }
    func setConstraints() {
        NSLayoutConstraint.activate([
            backgroundCell.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.inset16),
            backgroundCell.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.inset36),
            backgroundCell.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            backgroundCell.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -LayoutConstants.inset8)
        ])
        NSLayoutConstraint.activate([
            circleView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            circleView.leadingAnchor.constraint(equalTo: leadingAnchor),
            circleView.heightAnchor.constraint(equalToConstant: LayoutConstants.circleViewRadius72),
            circleView.widthAnchor.constraint(equalToConstant: LayoutConstants.circleViewRadius72)
        ])
        NSLayoutConstraint.activate([
            kidsImageView.topAnchor.constraint(equalTo: circleView.topAnchor, constant: LayoutConstants.inset8),
            kidsImageView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor, constant: LayoutConstants.inset8),
            kidsImageView.trailingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: -LayoutConstants.inset8),
            kidsImageView.bottomAnchor.constraint(equalTo: circleView.bottomAnchor, constant: -LayoutConstants.inset8)
        ])
        NSLayoutConstraint.activate([
            kidNameLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            kidNameLabel.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: LayoutConstants.inset14),
            kidNameLabel.trailingAnchor.constraint(equalTo: greenImageView.leadingAnchor, constant: -LayoutConstants.inset10)
        ])
        NSLayoutConstraint.activate([
            greenImageView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            greenImageView.widthAnchor.constraint(equalToConstant: LayoutConstants.inset20),
            greenImageView.heightAnchor.constraint(equalToConstant: LayoutConstants.inset20),
            greenImageView.trailingAnchor.constraint(equalTo: tasksLabel.leadingAnchor, constant: -LayoutConstants.inset6)
        ])
        NSLayoutConstraint.activate([
            doneImageView.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            doneImageView.centerXAnchor.constraint(equalTo: greenImageView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            tasksLabel.centerYAnchor.constraint(equalTo: backgroundCell.centerYAnchor),
            tasksLabel.trailingAnchor.constraint(equalTo: backgroundCell.trailingAnchor, constant: -LayoutConstants.inset16),
        ])
        let optionalWidthConstraint = tasksLabel.widthAnchor.constraint(equalToConstant: LayoutConstants.inset10)
        optionalWidthConstraint.priority = .defaultLow
        NSLayoutConstraint.activate([optionalWidthConstraint])
    }
}
