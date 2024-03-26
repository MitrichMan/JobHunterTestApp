//
//  VacancyView.swift
//  JobHunterTestApp
//
//  Created by Dmitrii Melnikov on 24.03.2024.
//

import SwiftUI

struct VacancyView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            ScrollView {
                VStack(alignment: .leading) {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Spacer()
                        
                        Image(systemName: "eye")
                            .resizable()
                            .frame(width: 28, height: 24)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Image(systemName: "slider.horizontal.3")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                        
                        Image(systemName: "heart.fill")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .fontWeight(.semibold)
                            .foregroundColor(.blue)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 8)
                    
                    HStack {
                        VStack(alignment: .leading) {
                            Text("UI/UX Designer")
                                .font(.system(size: 26, weight: .semibold))
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
    }
}

#Preview {
    VacancyView()
}
