import os
import string
import Levenshtein
import PyPDF4
from nltk.corpus import stopwords
from django.conf import settings


def read_pdf_file(file_path):
    file = open(file_path, 'rb')
    file_reader = PyPDF4.PdfFileReader(file)
    num_pages = file_reader.numPages
    final_string = ''

    for i in range(num_pages):
        page = file_reader.getPage(i)
        final_string += page.extractText()

    return final_string


# Clean Data-----------------------------------------------
def remove_punctuations(txt, punctuation=string.punctuation):
    """
    This function will remove punctuations from the input text
    """
    return ''.join([c for c in txt if c not in punctuation])


def remove_stopwords(txt, sw=None):
    """
    This function will remove the stopwords from the input txt
    """
    if sw is None:
        sw = list(stopwords.words('english'))
    return ' '.join([w for w in txt.split() if w.lower() not in sw])


def clean_data(txt):
    txt_clean = remove_punctuations(remove_stopwords(txt))
    return txt_clean


# Get Levenshtein Matrix
def get_levenshtein_matrix(str1, str2):
    matrix_ = [[0 for _ in range(len(str2) + 1)] for _ in range(len(str1) + 1)]
    for i in range(len(str1) + 1):
        matrix_[i][0] = i
    for j in range(len(str2) + 1):
        matrix_[0][j] = j

    for i in range(1, len(str1) + 1):
        for j in range(1, len(str2) + 1):
            if str1[i - 1] == str2[j - 1]:
                matrix_[i][j] = matrix_[i - 1][j - 1]
            else:
                matrix_[i][j] = min(matrix_[i - 1][j - 1] + 1, matrix_[i - 1][j] + 1, matrix_[i][j - 1] + 1)

    return matrix_


# Get Percentage between two strings using Levenshtein
def get_percentage(str1, str2):
    return round(100 - (Levenshtein.distance(str1, str2) / max(len(str1), len(str2)) * 100))


# Function for Check plagiarism with levenstein
def check_plagiarism(percentage_):
    if percentage_ > 40:
        return 'Plagiarism Detected'
    else:
        return 'No Plagiarism Detected'


# Function for check one by one in data samples with single data target
def check_plagiarism_all(file_target_path):
    plagiarism_list = []
    for file in os.listdir(f'{settings.BASE_DIR}/media/proposal'):
        if file.endswith('.pdf') and file != os.path.basename(file_target_path):
            user_article_ = read_pdf_file(file_target_path)
            user_article_clean_ = clean_data(user_article_)
            db_article_ = read_pdf_file(f'{settings.BASE_DIR}/media/proposal/{file}')
            db_article_clean_ = clean_data(db_article_)
            percentage_ = get_percentage(user_article_clean_, db_article_clean_)

            output = {'file': file, 'percentage': percentage_, 'plagiarism': check_plagiarism(percentage_)}

            # Append to list
            plagiarism_list.append(output)
    return plagiarism_list


# Get the highest percentage from the list
def get_highest_percentage(plagiarism_list):
    highest_percentage = 0
    for item in plagiarism_list:
        if item['percentage'] > highest_percentage:
            highest_percentage = item['percentage']
    return highest_percentage
