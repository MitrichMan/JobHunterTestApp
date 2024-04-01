//
//  VacancyView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 24.03.2024.
//

import SwiftUI

struct VacancyView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var vacancy: Vacancy
    
//    var isFavourite = false
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(alignment: .leading) {
                HStack {
                    Button {
                        coordinator.pop()
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
                        VStack(alignment: .leading) {
                            Text("UI/UX Designer")
                                .font(.system(size: 22, weight: .semibold))
                                .foregroundStyle(.white)
                            
                            Text("Уровень дохода не указан")
                                .font(.system(size: 16))
                                .foregroundStyle(.white)
                                .padding(.vertical, 4)
                            
                            Text("Требуемый опыт: от 1 года до 3 лет")
                                .font(.system(size: 16))
                                .foregroundStyle(.white)
                            
                            Text("Полная занятость, полный день")
                                .font(.system(size: 16))
                                .foregroundStyle(.white)
                        }
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    HStack {
                        Color.green
                            .frame(height: 50)
                            .cornerRadius(12)
                        
                        Color.green
                            .frame(height: 50)
                            .cornerRadius(12)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    ZStack {
                        Color.gray
                            .cornerRadius(12)
                        
                        VStack {
                            HStack {
                                Text("Мобирикс")
                                    .font(.system(size: 18, weight: .semibold))
                                    .foregroundStyle(.white)
                                
                                Image(systemName: "checkmark.circle")
                                
                                Spacer()
                            }
                            
                            Image(.photo20240223115208)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .cornerRadius(12)
                            
                            HStack {
                                Text("Минск, улица Бирюзова, 4/5")
                                    .font(.system(size: 16))
                                    .foregroundStyle(.white)
                                
                                Spacer()
                            }
                        }
                        .padding()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    Text("MOBYRIX - динамично развивающаяся продуктовая IT-компания, специализирующаяся на разработке мобильных приложений для iOS и Android. Наша команда работает над собственными продуктами в разнообразных сферах: от утилит до развлечений и бизнес-приложений. Мы ценим талант и стремление к инновациям и в данный момент в поиске талантливого UX/UI Designer, готового присоединиться к нашей команде и внести значимый вклад в развитие наших проектов.")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    HStack {
                        Text("Ваши задачи")
                            .font(.system(size: 24, weight: .semibold))
                            .foregroundStyle(.white)
                        
                        Spacer()
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    Text("-Проектировать пользовательский опыт, проводить UX исследования; -Разрабатывать адаптивный дизайн интерфейса для мобильных приложений; -Разрабатывать быстрые прототипы для тестирования идеи дизайна и их последующая; интеграция на основе обратной связи от команды и пользователей; -Взаимодействовать с командой разработчиков для обеспечения точной реализации ваших дизайнов; -Анализ пользовательского опыта и адаптация под тренды.")
                        .font(.system(size: 16))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.vertical, 8)
                    
                    Text("Задайте вопрос работодателю")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .padding(.horizontal)
                        .padding(.top, 8)
                    
                    Text("Он получит его с откликом на вакансию")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.gray)
                        .padding(.horizontal)
                        .padding(.bottom, 8)
                    
                    HStack {
                        ZStack {
                            Capsule()
                                .foregroundStyle(.gray)
                            
                            Text("Какой график работы?")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white)
                                .padding(.vertical, 4)
                        }
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    Button {} label: {
                        ZStack {
                            Capsule()
                                .foregroundStyle(.green)
                            Text("Откликнуться")
                                .foregroundStyle(.white)
                        }
                        .frame(height: 35)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    VacancyView(vacancy:
        Vacancy(
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
    )
    )
}
