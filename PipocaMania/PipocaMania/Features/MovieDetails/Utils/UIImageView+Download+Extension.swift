import UIKit

extension UIImageView {
    func download(from url: URL) {
        let activityIndicator = createActivityIndicator()
        activityIndicator.startAnimating()
        
        if image == nil{
            addSubview(activityIndicator)
        }
        
        URLSession.shared.dataTask(with: url) { data, _, error in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            
            DispatchQueue.main.async { [weak self] in
                let image = UIImage(data: data!)
                activityIndicator.removeFromSuperview()
                self?.image = image
            }
        }
        .resume()
    }
    
    private func createActivityIndicator() ->  UIActivityIndicatorView {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.frame = CGRect.init(
            x: 0,
            y: 0,
            width: frame.size.width,
            height: frame.size.height
        )
        return activityIndicator
    }
}
