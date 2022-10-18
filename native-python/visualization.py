import Levenshtein
from matplotlib import pyplot as plt

from algoritm_levenstein import (
                                 get_levenshtein_matrix, get_percentage, read_pdf_file, clean_data,
                                 check_plagiarism_all)

# article cleaned
user_article = read_pdf_file('data_target/user_article.pdf')
db_article = read_pdf_file('data_samples/db_article.pdf')
user_article_clean = clean_data(user_article)
db_article_clean = clean_data(db_article)

# Data Print contoh dari perbandingan dua document
distances = Levenshtein.distance(user_article_clean, db_article_clean)
percentage = get_percentage(user_article_clean, db_article_clean)
matrix = get_levenshtein_matrix(user_article_clean, db_article_clean)

print(len(user_article_clean))
print(len(db_article_clean))
print(f'distances - {distances}')
print(f'Similarity - {percentage}%')
# print(check_plagiarism(percentage))
#
# print('----------------------------------------')
# print('Check semua file')


# print list with loop of check plagiarism all
def print_plagiarism_all(plagiarism_list):
    for item in plagiarism_list:
        print(f'{item["file"]} - {item["percentage"]}% - {item["plagiarism"]}')


# print_plagiarism_all(check_plagiarism_all('data_target/user_article.pdf'))


# Matplotlib visualization of Levenshtein ---------------------------------------------------
# Levenshtein matrix Data Visualization using matplotlib
def plot_levenshtein_matrix(matrix_):
    plt.imshow(matrix_, cmap='Blues', interpolation='nearest')
    plt.ylabel('Article 1')
    plt.xlabel('Article 2')
    plt.show()


# plot_levenshtein_matrix(matrix)


# matrix linear data visualization using matplotlib
def plot_levenshtein_matrix_linear(matrix_):
    plt.plot(matrix_)
    plt.ylabel('Article 1')
    plt.xlabel('Article 2')
    plt.show()


# plot_levenshtein_matrix_linear(matrix)


# Get Levenstein visualization
def get_levenshtein_visualization(matrix_):
    for i in range(len(matrix_)):
        for j in range(len(matrix_[i])):
            print(matrix_[i][j], end=' ')
    return matrix_

# Pakai string dikit karena kalau pdf hasil output nya kebanyakan. Nggak bisa dibaca manusia visualization nya
# get_levenshtein_visualization(get_levenshtein_matrix('buku', 'kutu'))
