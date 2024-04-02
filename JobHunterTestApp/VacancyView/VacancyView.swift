//
//  VacancyView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 24.03.2024.
//

import SwiftUI

struct VacancyView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @StateObject var viewModel = VacancyViewModel()
    
    @Binding var vacancyIsPresented: Bool
    var vacancy: Vacancy
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        vacancyIsPresented = false
                        
                    } label: {
                        Image(.leftArrowDefault)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundStyle(.gray4)
                    }
                    
                    Spacer()
                    
                    Image(.eyeActive)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                    
                    Image(.shareDefault)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .foregroundColor(.white)
                    
                    if  vacancy.isFavorite {
                        Image(.heartFill)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    } else {
                        Image(.heartDefault)
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 8)
                
                ScrollView {
                    HStack {
                        VStack(alignment: .leading, spacing: 6) {
                            Text(vacancy.title)
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundStyle(.white)
                            
                            Text(vacancy.salary.full)
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                                .padding(.vertical, 8)
                            
                            Text("Требуемый опыт: \(vacancy.experience.text)")
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                            
                            Text(viewModel.getSchedulesString(from: vacancy.schedules))
                                .font(.system(size: 14))
                                .foregroundStyle(.white)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    if vacancy.appliedNumber != nil || vacancy.appliedNumber != nil {
                        HStack {
                            if vacancy.appliedNumber != nil {
                                ZStack {
                                    Color.darkGreen
                                        .frame(height: 50)
                                        .cornerRadius(12)
                                    
                                    HStack(spacing: 8) {
                                        Text("\(vacancy.appliedNumber ?? 0) человек уже откликнулись")
                                            .font(.system(size: 14))
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                        
                                        VStack {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 16)
                                                    .foregroundColor(.green1)
                                                
                                                Image(.profileDefault)
                                                    .resizable()
                                                    .foregroundStyle(.white)
                                                    .frame(width: 8, height: 8)
                                                
                                            }
                                            Spacer()
                                        }
                                    }
                                    .padding(8)
                                }
                            }
                            
                            if vacancy.lookingNumber != nil {
                                ZStack {
                                    Color.darkGreen
                                        .frame(height: 50)
                                        .cornerRadius(12)
                                    
                                    HStack(spacing: 8) {
                                        Text("\(vacancy.lookingNumber ?? 0) человека сейчас смотрят")
                                            .font(.system(size: 14))
                                            .foregroundStyle(.white)
                                        
                                        Spacer()
                                        
                                        VStack {
                                            ZStack {
                                                Circle()
                                                    .frame(width: 16)
                                                    .foregroundColor(.green1)
                                                
                                                Image(.eyeActive)
                                                    .resizable()
                                                    .foregroundStyle(.white)
                                                    .frame(width: 8, height: 8)
                                                
                                            }
                                            Spacer()
                                        }
                                    }
                                    .padding(8)
                                }
                            }
                        }
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    }
                    
                    ZStack {
                        Color.gray1
                            .cornerRadius(12)
                        
                        VStack(spacing: 8) {
                            HStack {
                                Text(vacancy.company)
                                    .font(.system(size: 16, weight: .medium))
                                    .foregroundStyle(.white)
                                
                                Image(systemName: "checkmark.circle")
                                    .resizable()
                                    .frame(width: 12, height: 12)
                                    .foregroundStyle(.gray3)
                                
                                Spacer()
                            }
                            
                            Image(.photo20240223115208)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(12)
                            
                            HStack {
                                Text("\(vacancy.address.town), \(vacancy.address.street) \(vacancy.address.house)")
                                    .font(.system(size: 14))
                                    .foregroundStyle(.white)
                                
                                Spacer()
                            }
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    if vacancy.description != nil {
                        Text(vacancy.description ?? "")
                            .font(.system(size: 16))
                            .foregroundStyle(.white)
                            .padding(.horizontal)
                            .padding(.vertical, 8)
                    }
                    
                    HStack {
                        Text("Ваши задачи")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    Text(vacancy.responsibilities)
                        .font(.system(size: 14))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("Задайте вопрос работодателю")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.white)
                                .padding(.horizontal)
                                .padding(.top, 8)
                            
                            Text("Он получит его с откликом на вакансию")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundStyle(.gray3)
                                .padding(.horizontal)
                                .padding(.bottom, 8)
                        }
                        
                        Spacer()
                    }
                    
                    
                    ForEach(vacancy.questions, id: \.self) { question in
                        Button {} label: {
                            HStack {
                                Text(question)
                                    .font(.system(size: 14, weight: .medium))
                                    .foregroundStyle(.white)
                                    .padding(8)
                                    .background(.gray3, in: .capsule, fillStyle: .init(eoFill: true))
                                
                                Spacer()
                            }
                            .padding(.horizontal)
                        }
                    }
                    Button {} label: {
                        ZStack {
                            Color.green1
                                .cornerRadius(8)
                            
                            HStack {
                            Spacer()
                            
                            Text("Откликнуться")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 16, weight: .semibold))
                            
                            Spacer()
                            }
                            .padding(14)
                        }
                }
//                .buttonStyle(.borderedProminent)
                .padding(.horizontal)
                .padding(.vertical, 8)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    VacancyView(
        vacancyIsPresented: .constant(true),
        vacancy: Vacancy(
            id: "cbf0c984-7c6c-4ada-82da-e29dc698bb50",
            lookingNumber: 2,
            title: "UI/UX дизайнер",
            address: Address(
                town: "Минск",
                street: "улица Бирюзова",
                house: "4/5"
            ),
            company: "Мобирикс",
            experience: Experience(
                previewText: "Опыт от 1 до 3 лет",
                text: "1–3 года"
            ),
            publishedDate: "2024-02-20",
            isFavorite: false,
            salary: Salary(
                full: "Уровень дохода не указан",
                short: nil
            ),
            schedules: [
                "полная занятость",
                "полный день"
            ],
            appliedNumber: 147,
            description: "Мы ищем специалиста на позицию UX/UI Designer, который вместе с коллегами будет заниматься проектированием пользовательских интерфейсов внутренних и внешних продуктов компании.",
            responsibilities: "- проектирование пользовательских сценариев и создание прототипов;\n- разработка интерфейсов для продуктов компании (Web+App);\n- работа над созданием и улучшением Дизайн-системы;\n- взаимодействие с командами frontend-разработки;\n- контроль качества внедрения дизайна;\n- ситуативно: создание презентаций и других материалов на основе фирменного стиля компании",
            questions: [
                "Где располагается место работы?",
                "Какой график работы?",
                "Вакансия открыта?",
                "Какая оплата труда?"
            ]
        ))
}
