//
// Created by Eugene Kazaev on 15/01/2018.
//

import UIKit

/// Default split container step
public final class SplitControllerStep<VC: UISplitViewController, Context>: SingleContainerStep<NilFinder<VC, Context>, SplitControllerFactory<VC, Context>> {

    // MARK: Methods

    /// Constructor.
    public init() {
        super.init(finder: NilFinder(), factory: SplitControllerFactory<VC, Context>())
    }

}
