object WebModule1: TWebModule1
  OldCreateOrder = False
  Actions = <
    item
      Default = True
      Name = 'DefaultHandler'
      PathInfo = '/'
      OnAction = WebModule1DefaultHandlerAction
    end>
  Height = 439
  Width = 414
  object DSServer1: TDSServer
    Left = 64
    Top = 43
  end
  object DSHTTPWebDispatcher1: TDSHTTPWebDispatcher
    DSContext = 'V1/'
    Server = DSServer1
    Filters = <>
    OnFormatResult = DSHTTPWebDispatcher1FormatResult
    WebDispatch.PathInfo = 'V1*'
    Left = 72
    Top = 195
  end
  object DSServerClass1: TDSServerClass
    OnGetClass = DSServerClass1GetClass
    Server = DSServer1
    LifeCycle = 'Invocation'
    Left = 72
    Top = 123
  end
  object WebFileDispatcher1: TWebFileDispatcher
    WebFileExtensions = <
      item
        MimeType = 'text/css'
        Extensions = 'css'
      end
      item
        MimeType = 'text/javascript'
        Extensions = 'js'
      end
      item
        MimeType = 'image/x-png'
        Extensions = 'png'
      end
      item
        MimeType = 'text/html'
        Extensions = 'htm;html'
      end
      item
        MimeType = 'image/jpeg'
        Extensions = 'jpg;jpeg;jpe'
      end
      item
        MimeType = 'image/gif'
        Extensions = 'gif'
      end>
    BeforeDispatch = WebFileDispatcher1BeforeDispatch
    WebDirectories = <
      item
        DirectoryAction = dirInclude
        DirectoryMask = '*'
      end
      item
        DirectoryAction = dirExclude
        DirectoryMask = '\templates\*'
      end>
    RootDirectory = '.'
    Left = 72
    Top = 280
  end
  object DSProxyGenerator1: TDSProxyGenerator
    ExcludeClasses = 'DSMetadata'
    MetaDataProvider = DSServerMetaDataProvider1
    Writer = 'Java Script REST'
    Left = 64
    Top = 368
  end
  object DSServerMetaDataProvider1: TDSServerMetaDataProvider
    Server = DSServer1
    Left = 232
    Top = 344
  end
  object DSHTTPWebDispatcher2: TDSHTTPWebDispatcher
    Server = DSServer2
    Filters = <>
    Left = 264
    Top = 192
  end
  object DSServer2: TDSServer
    Left = 264
    Top = 40
  end
  object DSServerClass2: TDSServerClass
    OnGetClass = DSServerClass2GetClass
    Server = DSServer2
    Left = 264
    Top = 120
  end
end
