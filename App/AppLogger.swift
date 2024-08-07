import OSLog

class AppLogger {
    // 開発環境(デバック、ステージング、リリース)
    // 環境に基づいて、異なるレベルのログを出力するために定義
    enum DevelopEnvironment {
        case debug
        case staging
        case release
        
        static var current: Self {
            #if DEBUG
            return .debug
            #elseif STAGING
            return .staging
            #else
            return .release
            #endif
        }
    }
    
    // ログのカテゴリ
    enum LogCategory: String {
        case ui = "User Interface"
        case network = "Network"
    }
    
    /// - Parameters
    /// - message: メッセージ
    /// - category: カテゴリ
    /// - type: ログタイプ
    static func logMessage(
        _ message: String,
        category: LogCategory,
        type: OSLogType
    ) {
        let logger = Logger(
            subsystem: Bundle.main.bundleIdentifier ?? "unknown",
            category: category.rawValue
        )
        switch DevelopEnvironment.current {
        case .debug:
            logger.log(
                level: type,
                "\(message)"
            )
            self.writeToLogFile(message: message, type: type, category: category)
        case .staging:
            if type == .info || type == .error || type == .fault {
                logger.log(
                    level: type,
                    "\(message)"
                )
                self.writeToLogFile(message: message, type: type, category: category)
            }
        case .release:
            if type == .error || type == .fault {
                logger.log(
                    level: type,
                    "\(message)"
                )
            }
        }
    }
    
    private static func writeToLogFile(message: String, type: OSLogType, category: LogCategory) {
        //ファイルパスの生成
        let fileURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("applog.txt")
        //ログエントリのフォーマット
        let logEntry = "[\(Date())] [\(type)] [\(category.rawValue)]: \(message)\n"
        // ファイルマネージャーを使用してファイルの存在をチェック
        if !FileManager.default.fileExists(atPath: fileURL.path) {
            // ファイルが存在しない場合は空のファイルを作成
            FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: nil)
        }
        //ファイルへの書き込み
        do {
            let fileHandle = try FileHandle(forWritingTo: fileURL)
            try fileHandle.seekToEnd()
            if let data = logEntry.data(using: .utf8) {
                try fileHandle.write(contentsOf: data)
            }
            //ファイルクローズ
            try fileHandle.close()
            print("fileURL:",fileURL)
        } catch {
            print("Error writing to log file: \(error)")
        }
    }
}
