//
//  ExpandableSectionView.swift
//  AlDwaaNewApp
//
//  Created by ahmed hussien on 31/08/2023.
//

import Foundation
import SwiftUI

enum SectionState {
    case expanded, folded
}


struct TopExpandableSectionView<Content: View,Content2: View>: View {
    @State var sectionState: SectionState = .folded
    var title: String
    var exContent: Content
    var foContent: Content2
    
    init(title:String,@ViewBuilder exContent: ()->Content,@ViewBuilder foContent: ()->Content2) {
        self.exContent = exContent()
        self.foContent = foContent()
        self.title = title
    }
    var body: some View {
        VStack {
            HStack{
                Text(title.localized())
                    .appFont(.headline)
                    .foregroundColor(.theme.primary)
                Spacer()
            }
            .padding()

            if sectionState == .expanded {
                exContent
            } else {
                foContent
            }
            
            
            AppButton(state: .constant(.normal), style: .plain) {
                withAnimation {
                    self.sectionState = sectionState == .expanded ? .folded : .expanded
                }
            } builder: {
                VStack{
                    if sectionState == .expanded {
                        Text("See less")
                            .appFont(.caption)
                            .foregroundColor(.gray)
                        Image("dropUpNew")
                        
                    } else {
                        Image("dropdownNew")
                        Text("See more")
                            .appFont(.caption)
                            

                    }
                }
            }
            .padding()
        }
        .background(Color.theme.bgWhite)
    }

}

struct BottomExpandableSectionView<Content: View,Content2: View>: View {
    @State var sectionState: SectionState = .folded
    var title: String
    var exContent: Content
    var foContent: Content2
    
    init(title:String,@ViewBuilder exContent: ()->Content,@ViewBuilder foContent: ()->Content2) {
        self.exContent = exContent()
        self.foContent = foContent()
        self.title = title
    }
    var body: some View {
        VStack {
            HStack{
                Text(title.localized())
                    .appFont(.headline)
                    .foregroundColor(.theme.primary)
                Spacer()
            }
            .padding()
            
            if sectionState == .expanded {
                exContent
            } else {
                foContent
            }
            
            
            AppButton(state: .constant(.normal), style: .plain) {
                withAnimation {
                    self.sectionState = sectionState == .expanded ? .folded : .expanded
                }
            } builder: {
                VStack{
                    if sectionState == .expanded {
                        Text("See less")
                            .appFont(.caption)
                            .foregroundColor(.gray)
                        Image("dropUpNew")
                        
                    } else {
                        Image("dropdownNew")
                        Text("See more")
                            .appFont(.caption)

                    }
                }
            }
            .padding()
        }
        .background(Color.theme.bgWhite)
    }

}
