// Copyright (c) 2022 NetEase, Inc. All rights reserved.
// Use of this source code is governed by a MIT license that can be
// found in the LICENSE file.

import Foundation

// MARK: - DotLottieUtils

struct DotLottieUtils {
  static let dotLottieExtension = "lottie"
  static let jsonExtension = "json"

  /// Temp folder to app directory
  static var tempDirectoryURL: URL {
    if #available(iOS 10.0, *) {
      return FileManager.default.temporaryDirectory
    }
    return URL(fileURLWithPath: NSTemporaryDirectory())
  }
}

extension URL {
  /// Checks if url is a lottie file
  var isDotLottie: Bool {
    pathExtension == DotLottieUtils.dotLottieExtension
  }

  /// Checks if url is a json file
  var isJsonFile: Bool {
    pathExtension == DotLottieUtils.jsonExtension
  }

  var urls: [URL] {
    FileManager.default.urls(for: self) ?? []
  }
}

extension FileManager {
  /// Lists urls for all files in a directory
  /// - Parameters:
  ///  - url: URL of directory to search
  ///  - skipsHiddenFiles: If should or not show hidden files
  /// - Returns: Returns urls of all files matching criteria in the directory
  func urls(for url: URL, skipsHiddenFiles: Bool = true) -> [URL]? {
    try? contentsOfDirectory(at: url, includingPropertiesForKeys: nil, options: skipsHiddenFiles ? .skipsHiddenFiles : [])
  }
}

// MARK: - DotLottieError

public enum DotLottieError: Error {
  case invalidFileFormat
  case invalidData
  case animationNotAvailable
}
