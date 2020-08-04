# FlodTableViewCellDemo
UITableViewCell 实现折叠展开 通过autolayout


> 开发过程中我们有很多场景涉及到 对一个cell 进行折叠与展开的操作；很早很早以前我们是通过frame布局cell的，
当初的策略是，通过修改操作的cell的高度（代理方法返回），然后刷新操作的cell，以实现高度的更新。  

> 其实这样的体验很差，我们的cell 会闪动，并且cell 刷新后位置可能并不是在原来的位置了（frame.origin.y）;

> 好在目前AutoLayout 已经足够成熟，并且习惯AutoLayout，相信很多人已经不愿意再回到frame的时代了。那么我们这里就主要是讲一讲通过autolayout
如何实现UITableViewCell的折叠展开（高度改变）

假如我们的高度是通过我们添加的自定义的一个橘黄色的View的height 来改变的，后面我们统一称ContentV；我们改变ContentV的约束，cell的高度就会通过
contentV的高度 自动适应。我们需要拖出contentV的高度的约束 **contentHeightC** 后面我们就通过改变这个约束值来改变Cell的高度

```Swift
// 折叠
@IBAction func flodBtnAct(_ sender: Any) {
    guard let tableView = self.superview as? UITableView else {
        return
    }
    //        tableView.beginUpdates() // 老API
    //        tableView.endUpdates()

    // 新API
    tableView.performBatchUpdates({
        self.contentHeightC.constant = 50
    }, completion: { (_) in
    })
}
// 展开
@IBAction func unflodBtnAct(_ sender: Any) {

    guard let tableView = self.superview as? UITableView else {
        return
    }

    // 新API
    tableView.performBatchUpdates({
        self.contentHeightC.constant = 109
    }, completion: { (_) in
    })
}
```

## 官方描述

Discussion

Use this method in cases where you want to make multiple changes to the table view in one single animated operation, as opposed to several separate animations. Use the block passed in the updates parameter to specify all of the operations you want to perform.
Deletes are processed before inserts in batch operations. This means the indexes for the deletions are processed relative to the indexes of the table view’s state before the batch operation, and the indexes for the insertions are processed relative to the indexes of the state after all the deletions in the batch operation.

不是很理解这里的说明，不过实践出来这个折叠展开的效果是很不错的

## 遇到的问题

我们的cell 是完全通过contentHeightC来适应的，但是苹果自己UITableView 有对cell自动计算出来的一个值，所以当我们的约束优先级都是一样的时候，但是系统的UITableViewCell 又有很多约束cell的高度的条件;
比如说 分割线,比如...没想到.. 总之,系统计算出来的跟我们通过我们contentV计算出来的会差一点点；所以此时需要我们对我们的高度约束优先级作一个调整；只要低于系统的就可以了，本文设置的999亲测没有问题。
## 关于使用SnipKit 这里就不赘述了，毕竟SnipKit 跟XIB的自动布局完全相同的。

多谢指正





